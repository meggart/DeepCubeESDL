FROM jupyter/datascience-notebook

COPY Project.toml /opt/julia/environments/v1.6/Project.toml
COPY Manifest.toml /opt/julia/environments/v1.6/Manifest.toml
USER root
RUN chown "${NB_USER}" /opt/julia/environments/ && \
    fix-permissions /opt/julia/environments/

USER ${NB_USER}
RUN julia -e "using Pkg; Pkg.update(); Pkg.resolve()"