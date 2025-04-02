resource "aws_codecommit_repository" "gitops_repo_cc" {
  repository_name = "eks-gitops-repo"
  default_branch  = "main"
}

resource "aws_iam_user" "argocd_user" {
  name = "argocd-user"
}

resource "aws_iam_service_specific_credential" "argocd_codecommit_credential" {
  service_name = "codecommit.amazonaws.com"
  user_name    = aws_iam_user.argocd_user.name
}

resource "aws_iam_user_policy" "argocd_user_codecommit_rw" {
  name = "argocd-user-codecommit-ro"
  user = aws_iam_user.argocd_user.name

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : "codecommit:*",
        Resource : aws_codecommit_repository.gitops_repo_cc.arn
      }
    ]
  })
}

resource "aws_secretsmanager_secret" "argocd_user_creds_secret" {
  name = "argocd-user-creds"
}

resource "aws_secretsmanager_secret_version" "argocd_user_creds_secret_version" {
  secret_id     = aws_secretsmanager_secret.argocd_user_creds_secret.id
  secret_string = jsonencode({
    url = "${aws_codecommit_repository.gitops_repo_cc.clone_url_http}"
    username = "${aws_iam_service_specific_credential.argocd_codecommit_credential.service_user_name}"
    password = "${aws_iam_service_specific_credential.argocd_codecommit_credential.service_password}"
  })
}
