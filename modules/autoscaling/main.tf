provider "aws" {
  region     = var.region
}

resource "aws_launch_configuration" "this" {
  name          = "web_config"
  image_id      = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [ var.security_group_id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "autoscaling-group"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = true
  launch_configuration      = aws_launch_configuration.this.name
#   availability_zones        = var.availability_zones
  vpc_zone_identifier       = var.subnets
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_policy" "this" {
  name                   = "asp-terraform-test"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name                = "terraform-test-cloudwatch"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "30"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  
   dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
  
    actions_enabled     = true
    alarm_actions     = [aws_autoscaling_policy.this.arn]

}

resource "aws_sns_topic" "this" {
  name = "user-updates-topic"
  display_name = "example auto scaling"
}

resource "aws_autoscaling_notification" "this" {
  group_names = [aws_autoscaling_group.this.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.this.arn
}