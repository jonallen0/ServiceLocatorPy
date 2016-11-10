FROM alpine:3.4

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache

COPY ServiceLocatorPy /tmp/service/ServiceLocatorPy
COPY requirements.txt /tmp/service/requirements.txt
COPY setup.py /tmp/service/setup.py
COPY conf/ServiceLocatorPy.conf /etc/ServiceLocatorPy.conf

RUN cd /tmp/service && \
    pip install --no-cache-dir -r requirements.txt && \
    python3 setup.py install && \
    cd - && \
    rm -rf /tmp/service

EXPOSE 8080

ENTRYPOINT ["python3", "-m", "ServiceLocatorPy"]
CMD ["--native", "--env", "production"]