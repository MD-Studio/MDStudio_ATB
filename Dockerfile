FROM mdstudio/mdstudio_docker3:0.0.3

# Set permissions and install package
COPY . /home/mdstudio/mdstudio_atb

RUN chown mdstudio:mdstudio /home/mdstudio/mdstudio_atb

WORKDIR /home/mdstudio/mdstudio_atb

RUN pip install .

USER mdstudio

# Set entrypoint and start process
CMD ["bash", "entry_point_mdstudio_atb.sh"]
