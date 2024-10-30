FROM sofaframework/sofabuilder_ubuntu:latest

ENV MYVARIABLE=0

RUN apt update
RUN apt install -y wget unzip git 
RUN wget https://github.com/sofa-framework/sofa/releases/download/v24.06.00/SOFA_v24.06.00_Linux.zip

RUN unzip SOFA_v24.06.00_Linux.zip

ENV PATH="/home/ci/SOFA_v24.06.00_Linux/bin:$PATH"
ENV PYTHONPATH="/home/ci/SOFA_v24.06.00_Linux/plugins/SofaPython3/lib/python3/site-packages/"