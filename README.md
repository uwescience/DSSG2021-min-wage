# DSSG2021-min-wage

Repo for code that can run outside the enclave, such as distance calculations, manipulation of shapefiles, aggregated maps, etc.

### Contribution Workflow:
We recommend using a `feature-branch` workflow: each user works on their own **local** `feature-branch`, pushes final changes to a **remote** `feature-brnach`. From the remote branch they can submit a **pull request** to the main branch on GitHub.

![](https://github.com/uwescience/DSSG2021-min-wage/blob/main/img/feature-workflow-external.png)


For more detailed description of the workflow check out the [Atlassian tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow).

Once you have your branch set up the main steps should be:

```
git add filename
git commit -m "adding filename"
git add filename
git commut -m "updateing the filename"
git pull origin main
git push origin feature-branch

```

Navigate to the GitHub interface and submit a Pull Request:

![](https://github.com/uwescience/DSSG2021-min-wage/blob/main/img/Compare_PullRequest.png)
