data "tls_certificate" "this" {
  url = var.cluster_oidc_issuer_url
}

resource "aws_iam_openid_connect_provider" "this" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.this.certificates[0].sha1_fingerprint]
  url             = var.cluster_oidc_issuer_url
}
