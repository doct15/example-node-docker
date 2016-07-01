# Getting Started Building and Deploying with Distelli - NodeJS Example

This tutorial will get you setup, building, testing, and deploying an application with Distelli in minutes. 

The tutorial assumes you have already:
* [Created a free Distelli account](https://www.distelli.com/signup)
* Have a login to, at least, one of the two public repositories.
 - <a href="https://github.com/" target="_blank">https://github.com/</a>
 - <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>
 
The scenario also expects that you have a **Destination** server available to do deployments of the example application.

### Step 1. Prepare Server for Deployment

To enable auto deployment of an application you must have a destination server to deploy to.

If you don't have a server you can use a virtual server. For a simple guide to setting up a virtual server using Virtualbox and Vagrant see [Building Virtual Servers](http://docs.distelli.com/docs/building-virtual-servers).

You must install the Distelli agent on the server to facilitate deployments. Instructions on installing the Distelli agent can be found here <a href="http://docs.distelli.com/docs/distelli-agent" target="_blank">Distelli agent reference guide.</a>

Install the agent and return to this document.

### Step 2. Fork and Clone the Repository

If your repository of choice is:
* Github, continue forward to [Fork Github Repository](#section-fork-github-repository).
* Bitbucket, continue forward to [Fork a Bitbucket Repository](#section-fork-bitbucket-repository).

#### <a name="section-fork-github-repository"></a>Fork Github Repository

1. Ensure you are logged into your Github account. <a href="https://github.com/" target="_blank">https://github.com/</a>
2. Go to this pubilc Distelli repository: <a href="https://github.com/distelli/nodejsbuilddeploy" target="_blank">https://github.com/distelli/nodejsbuilddeploy</a>.
3. Click the **Fork** button (top right).

You have forked the repository to your Github account. Good job!

You can view the forked repository in your Github account at:

```
https://github.com/YOUR_GITHUB_USERNAME/nodejsbuilddeploy
```

#### Clone Github Repository

You will need to clone a copy of the repository to your local machine. This assume you already have **git** installed on your local computer. If not you can install git from here: <a href="http://git-scm.com/" target="_blank">http://git-scm.com/</a>

Use the following syntax to clone the repository:

```
git clone https://github.com/YOUR_GITHUB_USERNAME/nodejsbuilddeploy.git
```

Now change to the newly created directory.

```
cd nodejsbuilddeploy
```

> Note: If your Github account is using **Two-factor authentication** you will not be able to use the above command to clone and work with the repository. 
> You must: 
> * Use an SSH key with github <a href="https://help.github.com/articles/generating-ssh-keys/" target="_blank">https://help.github.com/articles/generating-ssh-keys/</a> 
> * Use a different git clone syntax. See below:

```
git clone git@github.com:YOUR_GITHUB_USERNAME/nodejsbuilddeploy.git
```

To continue please proceed to [Step 3. Edit the Distelli Manifest](#step-3-edit-the-distelli-manifest).

#### <a name="section-fork-bitbucket-repository"></a>Fork Bitbucket Repository

1. Ensure you are logged into your Bitbucket account. <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>
2. Go to this pubilc Distelli repository: <a href="https://bitbucket.org/distelli/nodejsbuilddeploy" target="_blank">https://bitbucket.org/distelli/nodejsbuilddeploy</a>.
3. Click the 3 dots *actions* icon on the left.
4. Click the **Fork** option from the drop-own.

![alt text](https://www.filepicker.io/api/file/Q80lAWcsTriVf72N29n2 "bitbucket_fork_ANYbuilddeploy.png")

You have forked the repository to your Bitbucket account. Good job!

You can view the forked repository in your Bitbucket account at:

```
https://bitbucket.org/YOUR_BITBUCKET_USERNAME/nodejsbuilddeploy
```

#### Clone Bitbucket Repository

You will need to clone a copy of the repository to your local machine. This assumes you already have **mercurial** installed on your local computer. If not you can install mercurial from here: <a href="https://mercurial.selenic.com/" target="_blank">https://mercurial.selenic.com/</a>

Use the following syntax to clone the repository:

```
hg clone https://YOUR_BITBUCKET_USERNAME@bitbucket.org/YOUR_BITBUCKET_REPO/nodejsbuilddeploy
```

Now change to the newly created directory.

```
cd nodejsbuilddeploy
```

### <a name="step-3-edit-the-distelli-manifest"></a>Step 3. Edit the Distelli Manifest

The Distelli Manifest file provides the Distelli Platform with the needed information to successfully build and deploy your application. This file must exist before building your application with Distelli.

The sample application you cloned will already have an existing `distelli-manifest.yml` file in the application root directory. You will need to make a small change to this file before you can build and deploy the application with Distelli.

Edit the `distelli-manifest.yml` file. 

On the first line you will see a &lt;username&gt; placeholder, and then the name of the sample application.

Replace the &lt;username&gt; placeholder with your Distelli username.  To find your Distelli username see [Finding Your Distelli Username](http://docs.distelli.com/docs/finding-your-distelli-username).

For example if your username is 'YourUserName' your `distelli-manifest.yml` should look like this:

```
YourUserName/nodejsbuilddeploy:
  # Distelli Manifest example
  # this example assumes the build and deploy servers are:
  # Ubuntu 14.04

  PreRelease:
    - echo "---Beginning PreRelease---"
    - echo "--Installing build dependencies--"
    - echo "-Updating apt-get-"
    - sudo apt-get -y update
    - echo "-Installing nodejs-"
    - sudo apt-get -y install nodejs
    - echo "-Installing npm-"
    - sudo apt-get -y install npm
    - echo "--Building--"
    - sudo npm install
    - echo "--Testing--"
    - npm test

  PkgInclude:
    - '*'

  PkgExclude:
    - node_modules/

  PreInstall:
    - echo "---Begining PreInstall---"
    - echo "--Installing deploy dependencies--"
    - echo "-Updating apt-get-"
    - sudo apt-get -y update
    - echo "-Installing nodejs-"
    - sudo apt-get -y install nodejs
    - echo "-Installing npm-"
    - sudo apt-get -y install npm

  PostInstall:
    - echo "Begin PostInstall"
    - npm install
    
  Env:
    - PORT: 3000
    
  Exec:
    - /usr/bin/nodejs app.js
```

**Save your change.**

### Step 4. Create the Application

In this step you will use the Distelli *new application workflow* to create an application that is integrated with the repository you forked above.

To complete this section you will navigate to another set of instructions. There you will walk through those instructions, afterwards returning here.

Certain fields will need tutorial specific information. The table below has that information.

<table>
  <tr><td>Name</td><td>Value</td></tr>
  <tr><td>Name your App<br>Application Name</td><td>nodejsbuilddeploy</td></tr>
  <tr><td>Choose a Repo<br>Repository Name</td><td>nodejsbuilddeploy</td></tr>
  <tr><td>Choose a Branch<br>Branch Name</td><td>master</td></tr>
</table>


> After completing the **Tutorial Creating an Application from a Repository** return to this tutorial document.

Navigate to <a href="http://docs.distelli.com/docs/tutorial-creating-an-application-from-a-repository" target="_blank">Tutorial Creating an Application from a Repository</a>, follow the steps in the document, and then return here.

> Return here!

### Step 5. Enable Auto Build

1. In the Distelli WebUI click **Applications** at the top.
2. In the application list click **nodejsbuilddeploy** name to navigate to the application page.
3. Click the **Settings** link.

    You are now in the application settings page.

4. Check the **Automatically build this branch when a new commit is pushed** box.
5. Click **Save Repo Settings**

You have enabled auto build. 

> If you are interested in building on your own build server(s) see [Using your own Build Server](http://docs.distelli.com/docs/using-your-own-build-server).



### Step 6. Enable Auto Deploy

1. In the Distelli WebUI click the **Applications** link at the top.
2. In the application list click **nodejsbuilddeploy** name to navigate to the application page.
3. Click the **Settings** link.

    You are now in the application settings page.

4. Scroll down and find the **Repository Settings** section.
5. Check the **Automatically deploy this branch when a build succeeds** box.
6. Click on the **nodejsbuilddeploy-beta** environment to select it.
7. Click **Save Repo Settings**

You have enabled auto deploy.


### Step 7. Add Server to Environment

In the last step you enabled auto deploy for the application environment, but this environment currently has no servers in it to deploy to.

In this step you will add the server, from step 1, to the -beta environment.

1. In the Distelli WebUI click the **Applications** link at the top.
2. In the application list click **nodejsbuilddeploy** name to navigate to the application page.
3. Click the **Environments** link.
4. Click the **nodejsbuilddeploy-beta** environment.

    You are now at the environment page.

5. Click the **Servers** link in the environment section.
6. Click **Add Servers**.

    You should see the server from step 1 in the server list.

7. Check the **Add Server** box for the server from step 1.
8. Click the **Add Selected Servers** link near the top left

You have added a server to the environment.

### <a name="trigger-a-build"></a>Step 8. Trigger a Build

In a previous step you edited and saved the distelli-manifest.yml file in the nodejsbuilddeploy application directory. This constitutes a code change. You will now commit and push that code change up to your repository.

When the repository changes it will notify Distelli that a change occurred. This will trigger a build by Distelli.

Distelli will grab a copy of the repository; build it, test it, and if it is successful will create a release.

When a release is created this will trigger an auto deploy of the application to the -beta environment with the server from step 1.

If you are using:
* Github see [Push with Github](#section-push-with-github)
* Bitbucket see [Push with Bitbucket](#section-push-with-bitbucket)

#### <a name="section-push-with-github"></a>Push with Github

Enter the following commands in the `nodejsbuilddeploy` directory:

```
git add .
git commit -m "Set username in manifest"
git push -u origin master
```

This will push your code change up to the repository.

Continue on to [Step 9. Watch the Build and Deploy Process](#step-9-watch-the-build-and-deploy-process).

#### <a name="section-push-with-bitbucket"></a>Push with Bitbucket

Enter the following commands in the `nodejsbuilddeploy` directory:

```
hg commit -m "Set username in manifest"
hg push
```

This will push your code change up to the repository.

### <a name="step-9-watch-the-build-and-deploy-process"></a> Step 9. Watch the Build and Deploy Process

1. Click the **Builds** link at the top of the Distelli WebUI.

    In the builds list page you will see your build queued or in progress

2. Click on the build to navigate to the build page.

    From the build page you can watch the build log. If the build fails see the [Troubleshooting](#troubleshooting) section below.

### Step 10. Validation

To verify the application deployed correctly point your web browser to your destination server IP on port 3000.

```
http://YOUR_SERVER_IP:3000
```

### Understanding the Distelli Manifest

The distelli-manifest.yml provides the instructions for building, testing, and deploying the application.

![alt text](https://www.filepicker.io/api/file/pcRR6Ie5RJeeeX77dOng "nodejs-manifest-analysis.png")

For more information on the Distelli manifest see [Distelli Manifest](http://docs.distelli.com/docs/distelli-manifest).

### <a name="troubleshooting"></a> Troubleshooting

### Incorrect Manifest

If you see the following build failure:

```
Task Status: Exit=1 Signal=0

Cloning into '/distelli/tasks/d461-762'...
HEAD is now at 7db094e Update distelli-manifest.yml
Expected manifest(s) to contain app 'YourUserName/gobuilddeploy'. Instead the manifest(s) specified:
  '<username>/gobuilddeploy'
```

Ensure that you:
* Correctly edited the distelli-manifest.yml [Step 3](#step-3-edit-the-distelli-manifest).
* Committed and pushed the repository [Step 8](#step-8-trigger-a-build).

### Deploy Failure

For more information on troubleshooting deploys see [Troubleshooting Deploys](http://docs.distelli.com/docs/troubleshooting-deploys).

### Next

* [Tutorials Index](http://docs.distelli.com/docs/tutorials-index) 
* [Manifest Library of Examples](http://docs.distelli.com/docs/distelli-manifest-library-of-examples) 
* Read the Knowledge Base articles
* Check out the Reference Guides
