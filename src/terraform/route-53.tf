# #https://oneuptime.com/blog/post/2026-02-12-create-application-load-balancers-with-terraform/view
# # DNS validation record
# resource "aws_route53_record" "cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   zone_id = aws_lb.frontend.zone_id
#   name    = each.value.name
#   type    = each.value.type
#   records = [each.value.record]
#   ttl     = 60
# }

# # Wait for validation
# resource "aws_acm_certificate_validation" "main" {
#   certificate_arn         = aws_acm_certificate.main.arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
# }

# resource "aws_route53_record" "app" {
#   zone_id = aws_lb.frontend.zone_id
#   name    = "localhost.localstack.cloud"
#   type    = "A"

#   alias {
#     name                   = aws_lb.frontend.dns_name
#     zone_id                = aws_lb.frontend.zone_id
#     evaluate_target_health = true
#   }
# }
