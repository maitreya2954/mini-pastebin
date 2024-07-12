# Mini pastebin deployment

```bash
aws configure
aws ecr describe-images --repository-name <image-repo> --region <aws-region>
aws eks --region <aws-region> update-kubeconfig --name <aws-eks-cluster-name>
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f ingress.yaml
kubectl apply -f db-config.yaml
kubectl apply -f db-secrets.yaml

docker build --platform=linux/amd64 -t mini-pastebin-backend:latest ../backend
docker tag mini-pastebin-backend:latest <account-id>.dkr.ecr.<aws-region>.amazonaws.com/mini-pastebin-repo:backend
docker push  <account-id>.dkr.ecr.<aws-region>.amazonaws.com/mini-pastebin-repo:backend
```