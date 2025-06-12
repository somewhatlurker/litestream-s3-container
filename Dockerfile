FROM litestream/litestream:latest

COPY litestream.yml /etc/litestream.yml
COPY entrypoint.sh /scripts/entrypoint.sh

# make sure entrypoint is executable and on PATH
RUN chmod +x /scripts/entrypoint.sh
ENV PATH=${PATH}:/scripts

# sync-interval default value
ENV LITESTREAM_SYNC_INTERVAL=1s

ENTRYPOINT ["entrypoint.sh"]
CMD ["replicate"]
