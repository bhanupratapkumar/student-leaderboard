GOOGLE_PROJECT_ID=prime-imagery-308406
CLOUD_RUN_SERVICE=student-leaderboard-api
INSTANCE_CONNECTION_NAME=prime-imagery-308406:asia-south1:student-leaderboard
DB_USER=root
DB_PASS=root
DB_NAME=test

gcloud builds submit --tag gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
    --project=$GOOGLE_PROJECT_ID

gcloud run deploy $CLOUD_RUN_SERVICE \
    --image gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
    --add-cloudsql-instances $INSTANCE_CONNECTION_NAME \
    --update-env-vars INSTANCE_CONNECTION_NAME=$INSTANCE_CONNECTION_NAME,DB_PASS=$DB_PASS,DB_USER=$DB_USER,DB_NAME=$DB_NAME \
    --platform managed \
    --region asia-south1 \
    --allow-unauthenticated \
    --project=$GOOGLE_PROJECT_ID
