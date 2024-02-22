ARG BASE_IMG=<jupyter>

FROM $BASE_IMG

COPY --chown=jovyan:users requirements.txt /tmp/requirements.txt

RUN python3 -m pip install -r /tmp/requirements.txt --quiet --no-cache-dir \
 && rm -f /tmp/requirements.txt

COPY ../scripts/auto-act-kernel.sh /usr/local/bin/auto-act-kernel.sh

USER root

RUN chmod +x /usr/local/bin/auto-act-kernel.sh

USER jovyan

RUN /usr/local/bin/auto-act-kernel.sh
