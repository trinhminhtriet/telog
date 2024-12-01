FROM rust:slim AS builder

RUN apt-get update && apt-get install -y libssl-dev pkg-config libsystemd-dev
COPY . /telog
WORKDIR /telog
RUN cargo build --release --features=bin_core,ls_counter,ls_filesystem,ls_journald,ls_docker

FROM debian:stable-slim

COPY --from=builder /telog/target/release/telog /telog/telog

ENTRYPOINT [ "/telog/telog" ]
CMD [ "help" ]
