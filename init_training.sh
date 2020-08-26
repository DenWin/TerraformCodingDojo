#Usage: source init_training.sh

echo List of Terraform Environment-Variables
declare -p | cut -c12- | grep ^TF_ || echo "*** None found! ***"

echo
echo

echo aliases for Terraform
set -x
alias ti="terraform init"
alias tp="terraform plan"
alias ta="terraform apply"
alias td="terraform destroy"

alias tpp="terraform plan -out terraform.tfplan"
alias tap="terraform apply     terraform.tfplan"

{ set +x; } &>/dev/null # This line is only required if the
