FROM mdstudio/mdstudio_docker3:0.0.3

# Set permissions and install package
COPY . /home/mdstudio/mdstudio_atb

RUN chown -R mdstudio:mdstudio /home/mdstudio/mdstudio_atb
Run chmod -R 755 /home/mdstudio

WORKDIR /home/mdstudio/mdstudio_atb

RUN pip install -e .

USER mdstudio

# Set entrypoint and start process
CMD ["bash", "entry_point_mdstudio_atb.sh"]
