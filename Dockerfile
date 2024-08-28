
#ARG BUILD_FROM
#FROM $BUILD_FROM

FROM python:3-alpine

# Install requirements for add-on

COPY requirements.txt /
COPY pysml-master /pysml-master
#RUN apk add --no-cache python3 py3-requests py3-pip 
# py3-paho-mqtt

#RUN pip3 install requests urllib3 paho-mqtt
RUN pip3 install /pysml-master
RUN pip3 install aiomqtt asyncio-mqtt python-slugify

# Copy data for add-on
COPY sml-mqtt.py /
COPY data /data/

#CMD [ "python3", "/pysml-master/examples/sml-mqtt-bridge.py", "--config=data/options.cfg" ]
CMD [ "python3", "/sml-mqtt.py", "--config=data/options.cfg", "--hass" ]
