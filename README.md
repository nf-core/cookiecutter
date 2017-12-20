# NGI-NFcookiecutter
A template [Nextflow](https://www.nextflow.io/) analysis pipeline to built using [Cookiecutter](https://github.com/audreyr/cookiecutter).

Run `cookiecutter` with this repository to create a new Nextflow pipeline built with the details that you add when prompted. This gives a quick route to a solid pipeline that uses lots of Nextflow best-practices and nice features.

Specifically, it comes with:

* Skeleton pipeline script
    * A pipeline script that runs FastQC and MultiQC on FastQ files (can be kept or just used as an example)
    * A process and script to scrape the software versions of each tool you run (for MultiQC and logging)
    * Logging and HTML e-mail functionality to report pipeline configuration and software versions
    * Automatic HTML conversion and results output of pipeline "output" documentation markdown file
* Reference Genome implementation
    * Configuration files with paths to [AWS iGenomes](https://ewels.github.io/AWS-iGenomes/)
    * Example pipeline setup to handle a Fasta reference file using `--genome [genome ID]``
* Documentation
    * Pre-written general documentation to help your users get started with Nextflow and your pipeline.
    * Covers installation, usage, output, troubleshooting, reference genomes and configuration.
* Robust configuration setup
    * Simple inheritance hierarchy with builtin functions to limit the resources required
* Skeleton files for Docker image generation
* Skeleton files for automated testing using Travis CI

## Usage

### Step 1: Run cookiecutter
To use this template, first install cookiecutter:

```
pip install cookiecutter
```

Then run the wizard with this repository:

```
cookiecutter https://github.com/ewels/NGI-NFcookiecutter.git
```

### Step 2: Publish to GitHub
Create a new repository to hold your pipeline on GitHub. Match the variables that you entered whilst running the cookiecutter script (`github_repo`). Don't initialise with a README or any files, leave it blank.

Back on your computer, change directory into your new pipeline folder and initialise a git repository:
```
git init
```

Add your generated files, commit and push to GitHub:
```
git add .
git commit -m "First commit, based on NGI-NFcookiecutter template"
git remote add origin [your github remote url]
git push -u origin master
```

### Step 3: Write your pipeline!
Using the examples of FastQC and MultiQC, add in the steps that you want in your pipeline.

Remember that you can add process-specific configuration (eg. memory requirements) in `conf/base.config`.

### Step 4: Edit the Dockerfile
Your Nextflow pipeline will work best when using Docker and Singularity to handle software requirements. The pipeline comes with a basic Docker template file (Dockerfile) which installs FastQC and MultiQC. Edit this to add in any additional software packages that you need.

### Step 5: Publish your docker image
Nextflow and this pipeline are set up to automatically pull the docker image when the pipeline runs. Set up a new docker image on dockerhub (https://hub.docker.com/) at the address that you entered in the setup (`dockerhub_slug`).

Make sure that you create an _Automated Build_ that is connected to your GitHub repository and set to automatically build an image when you commit to master. Add a second automated build under _Build Settings_ so that an image is built when you create a new tag (stick with the default - every tag, same name as tag).

### Step 6: Write up the documentation
This cookiecutter comes with some basic documentation that's general to Nextflow, but you'll want to write some docs which are specific to your pipeline.

Note that `docs/output.md` is converted to HTML by the pipeline and saved to the results directory, so you'll want to be especially sure that this contains useful information.

### Step 7: Set up automated testing
Edit the demo data URL in `tests/run_test.sh` to point to a valid location and edit to run with required configuration.

Go to https://travis-ci.org/ and enable testing on your pipeline repository.

### Step 8: Release your pipeline
Once you're happy that your pipeline works, make a release on GitHub! This tags a stable version of your pipeline and associated docker image. People can then run your pipeline directly from GitHub with `-r [version]` to get super reproducible results!

Remember to update the `version` variable in your main script as you keep working after this.

### Celebrate!
That's it! You've just made a super cool new analysis pipeline in very little time! Congratulations!

## Credits
This template and most of the scripts within were written by Phil Ewels ([@ewels](https://github.com/ewels)) at the [National Genomics Infrastructure](https://portal.scilifelab.se/genomics/), part of [SciLifeLab](http://www.scilifelab.se/) in Stockholm, Sweden.

---

[![SciLifeLab](https://raw.githubusercontent.com/SciLifeLab/NGI-RNAseq/master/docs/images/SciLifeLab_logo.png)](http://www.scilifelab.se/)
[![National Genomics Infrastructure](https://raw.githubusercontent.com/SciLifeLab/NGI-RNAseq/master/docs/images/NGI_logo.png)](https://ngisweden.scilifelab.se/)

---
