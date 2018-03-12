FROM continuumio/miniconda
MAINTAINER {{ cookiecutter.author_name }} <{{ cookiecutter.author_email }}>
LABEL authors="{{ cookiecutter.author_email }}" \
    description="Docker image containing all requirements for {{ cookiecutter.pipeline_name }} pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml
ENV PATH /opt/conda/envs/nfcore-methylseq/bin:$PATH
