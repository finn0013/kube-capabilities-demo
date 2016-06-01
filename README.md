# Kubernetes
This is a demonstration of the kubernetes capabilities. It is intended to explore and provide examples for different parts of the kubernetes/docker ecosystems and how things fit together, along with variations. The goal is to provide basic visualization along with  these concepts in order to make it easer to grasp for newcomers.

This project will likely evolve into a staging place for experimenting with new concepts, such as expanding pods out to use things like flume, kafka, etc.

Note that this was written on a Mac using Vagrant. If you are using something else you’ll need to modify the set-kube-env.sh file in the kubernetes-helpers directory.

## Focus Areas
This project is broken up into a few different areas of focus:

* Docker - Exploring docker file options, automated build integration, repositories, etc.
* Web - Building solutions that play within kubernetes to demonstrate key concepts of docker/kubernetes in an easy to consume manner.
* Kubernetes Helpers - A simple set of file helpers to make life a little easier and to provide some reminders.
* Kubernetes - Exploring and demonstrating the various capabilities of the kubernetes project.

More information on these areas is listed below.

### Docker
Created a docker file that adds the nano text editor to the tomcat image. The purpose is to both demonstrate how images can be added to as well as to provide a mechanism for easy troubleshooting during this pilot.

### Web
Contains 3 files of interest: two do-nothing server status files and index.jsp, which gives a visual of what is happening on the cluster. Use the scripts detailed below to make interesting stuff actually happen on this page.

This also contains a static javascript mock up of deploying containers, blue-green deployments, container deployments, and declarative orchestration. I needed this while in India as I could not get the actual demo working from there so figured I'd throw it out in case anyone else needed it.

### Kubernetes Helpers
* set-kube-env.sh - Sets some basics for the environment like the number of minions, vagrant as the provider, etc.
* kube-all.sh - Lists the status for nodes, pods, services, replication controllers, secrets, namespace, and endpoints, all through a single command.
* kube-help.sh - Lists out useful commands in, primarily to be used as a reminder.

### Kubernetes
These files demonstrate how to set up the various aspects of the kubernetes/docker infrastructure.

#### YAML Files
##### kube-capabilities-demo-rc.yaml
The main monitoring Replication Controller. Key things this is creating/using:

* Secrets
* Services with exposed endpoints
  * See http://www.mcdonaldland.info/2015/08/27/kubernetes-exposing-port-outside-cluster/ if you are having trouble getting your endpoint to work.
* Replication Controllers
  * Annotations
  * Volumes
    * Git Repo
      * Copies files from gitRepo volume into web directory for serving over http.
    * Secrets
  * Container commands
  * Environment variables
  * Liveness Probe
  * Readiness Probe
  * Lifecycle events

##### kube-capabilities-demo-secret.yaml
A simple illustration of using secrets.

##### kube-capabilities-demo-svc.yaml
This makes our demo RC available outside the cluster - so you can hit it with you browser.

##### kube-capabilities-tomcat-rc.yaml
This is just an empty tomcat-nano container that isn't even exposed to the world. It is just here to illustrate the replication controllers capabilities for things like canary tests, blue-green deployments, etc.

##### kube-capabilities-tomcat-green-rc.yaml
This is used in the blue-green and subsequent green-blue deployments.

##### kube-capabilities-canary-rc.yaml
This is NOT a working replication controller file. This is intended to be a template that gets updated by the canary-test-start.sh script (outlined below).

#### Scripts

##### start-kcd.sh
Starts the cluster for demo purposes.

##### stop-kcd.sh
Stops the cluster. Don’t worry about errors here – it tries to stop everything that could possibly be running.

##### canary-test-start.sh
Creates 2 (or more if you supply a # arg) pods to mimic a canary test.

##### canary-test-stop.sh
Kills any running canary pods. Does nothing if canary-test-start.sh hasn’t been run first.

##### blue-green-start.sh
Runs a blue-green server deployment. Note that this does NOT do anything to validate sessions, users, shut down connections gracefully, etc.

For this script to work the cluster must be running 'blue' labeled pods (default after start-kcd.sh).

##### green-blue-start.sh
Runs a green-blue (reversing the blue-green) server deployment. Note that this does NOT do anything to validate sessions, users, shut down connections gracefully, etc.

For this script to work the cluster must be running 'green' labeled pods.
