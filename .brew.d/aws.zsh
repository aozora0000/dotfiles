source /usr/local/share/zsh/site-functions/_aws

function bucketExpire() {
    BUCKET=$1
    aws s3 ls s3://$BUCKET --recursive | awk -v BUCKET="${BUCKET}" '{system("aws s3api copy-object --bucket " BUCKET " --copy-source " BUCKET "/" $4 " --key " $4 " --metadata-directive REPLACE --cache-control \"max-age=3600\"")}'
}
