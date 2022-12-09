resource "aws_lb" "this" {
  name = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups = var.security_group_ids
  subnets = var.subnets
}


resource "aws_lb_target_group" "this" {
  name     = "alb-tg"
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id
}

# # Create a new ALB Target Group attachment
# resource "aws_autoscaling_attachment" "this" {
#   autoscaling_group_name = var.autoscaling_group_name
#   lb_target_group_arn    = aws_lb_target_group.this.arn
# }

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.instance_id
  port             = 8080
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.lb_port
  protocol          = var.lb_protocol
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}


# resource "aws_lb_listener_certificate" "this" {
#   listener_arn    = aws_lb_listener.this.arn
#   certificate_arn = var.acm_arn
# }

#Create Alias record towards ALB from Route53
resource "aws_route53_record" "this" {
  zone_id  = data.aws_route53_zone.this.zone_id
  name     = var.domain_name
  type     = "A"
  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }
}

data "aws_route53_zone" "this" {
  name         = var.root_domain_name
}