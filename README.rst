fedora-reveal.js docker image
=============================

Based on `Docker-reveal.js <https://github.com/danidemi/docker-reveal.js>`_
image, except it uses Fedora (currently 22) as it's base image. Run your 
`reveal.js <http://lab.hakim.se/reveal-js/#/>`_ server
in a docker container for presentation awesomeness, the devops way.

To build the image

.. code-block:: bash

    git clone https://github.com/djipko/fedora-reveal.js.git
    cd fedora-reveal.js && sudo docker build .

To run the container, just cd into the directory with your slides and go

.. code-block:: bash

  docker run -v $(pwd):/slides/ -p 8000:8000 fedora-reveal.js

Or as a simple demo you can just do

.. code-block:: bash

  docker run -p 8000:8000 fedora-reveal.js

In case you are running with SELinux in enforcing mode (of course you are), it
may be necessary to add `--privileged=true` to the above command.

After you're done - just point your browser to http://localhost:8000
