# Dockerfile
FROM apache/spark:4.0.0-scala2.13-java21-python3-r-ubuntu
USER root 

RUN apt-get update && apt-get install -y curl

# Python-Pakete für Spark 4.0
RUN pip3 install delta-spark==4.0.0
RUN pip3 install pyspark==4.0.0
RUN pip3 install boto3
RUN pip3 install minio

# JAR-Dateien for Spark 4.0 
# JAR-Dateien für Spark 4.0
RUN mkdir -p /opt/spark/jars && \
    curl -O https://repo1.maven.org/maven2/io/delta/delta-spark_2.13/4.0.0/delta-spark_2.13-4.0.0.jar \
    && curl -O https://repo1.maven.org/maven2/io/delta/delta-storage/4.0.0/delta-storage-4.0.0.jar \
    && curl -O https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.648/aws-java-sdk-bundle-1.12.648.jar \
    && curl -O https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.4.0/hadoop-aws-3.4.0.jar \
    && mv delta-spark_2.13-4.0.0.jar /opt/spark/jars/ \
    && mv delta-storage-4.0.0.jar /opt/spark/jars/ \
    && mv aws-java-sdk-bundle-1.12.648.jar /opt/spark/jars/ \
    && mv hadoop-aws-3.4.0.jar /opt/spark/jars/

USER spark
WORKDIR /opt/spark/work-dir