FROM ubuntu

RUN apt update && apt install ghdl gtkwave make --yes

WORKDIR /circuitos
COPY . .