# Dockerfile

# Verwenden Sie das Basisimage
FROM docker.io/bitnami/spark:3.5
USER root 
RUN apt-get update && apt-get install -y curl
RUN pip3 install delta-spark==3.0.0
RUN pip3 install pyspark==3.5.0
RUN pip3 install boto3
RUN pip3 install minio


RUN curl -O https://repo1.maven.org/maven2/software/amazon/awssdk/s3/2.18.41/s3-2.18.41.jar \
    && curl -O https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.12.367/aws-java-sdk-1.12.367.jar \
    && curl -O https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.1026/aws-java-sdk-bundle-1.11.1026.jar \
    && curl -O https://repo1.maven.org/maven2/io/delta/delta-core_2.12/2.3.0/delta-core_2.12-2.3.0.jar \
    && curl -O https://repo1.maven.org/maven2/io/delta/delta-storage/2.3.0/delta-storage-2.3.0.jar \
    && curl -O https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar \
    && mv s3-2.18.41.jar /opt/bitnami/spark/jars/ \
    && mv aws-java-sdk-1.12.367.jar /opt/bitnami/spark/jars/ \
    && mv aws-java-sdk-bundle-1.11.1026.jar /opt/bitnami/spark/jars/ \
    && mv delta-core_2.12-2.3.0.jar /opt/bitnami/spark/jars/ \
    && mv delta-storage-2.3.0.jar /opt/bitnami/spark/jars/ \
    && mv hadoop-aws-3.3.2.jar /opt/bitnami/spark/jars/
