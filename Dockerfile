FROM litestream/litestream:latest

COPY litestream.yml /etc/litestream.yml
COPY entrypoint.sh /scripts/entrypoint.sh

# make sure entrypoint is executable and on PATH
RUN chmod +x /scripts/entrypoint.sh
ENV PATH=${PATH}:/scripts

ENTRYPOINT ["entrypoint.sh"]
CMD ["replicate"]

