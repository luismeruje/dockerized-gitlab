gcloud compute addresses create ip-gitlab --region us-east1
gcloud compute target-pools create partimosocabobojador --region us-east1
gcloud compute target-pools add-instances partimosocabobojador --instances gitlab-gitlab-app-01,gitlab-gitlab-app-02,gitlab-gitlab-app-03 --instances-zone us-east1-b --region us-east1
gcloud compute forwarding-rules create partimosocabobojador1 --target-pool partimosocabobojador --ip-protocol tcp --ports 80 --region us-east1 --address ip-gitlab
gcloud compute forwarding-rules create partimosocabobojador2 --target-pool partimosocabobojador --ip-protocol tcp --ports 22 --region us-east1 --address ip-gitlab
gcloud compute forwarding-rules create partimosocabobojador3 --target-pool partimosocabobojador --ip-protocol tcp --ports 8080 --region us-east1 --address ip-gitlab


