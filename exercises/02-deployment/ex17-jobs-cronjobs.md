# Exercise 17: Jobs & CronJobs

**Time limit:** 6-8 minutes

## Goal
Create one-off Jobs and scheduled CronJobs.

## Requirements
1. Create a Job named `hello-job` that:
   - Runs `busybox:1.36`
   - Executes: `echo "hello"`
   - Completes successfully
2. Create a CronJob named `date-cron` that:
   - Schedule: `*/2 * * * *` (every 2 minutes)
   - Runs `busybox:1.36`
   - Executes: `date`

## Success Checks
```bash
# Check job completion
kubectl get jobs
kubectl logs job/hello-job

# Check cronjob and its created jobs
kubectl get cronjobs
kubectl get jobs -l app=date-cron  # or check owner references
```

## Why This Matters
Jobs and CronJobs are essential for batch processing and scheduled tasks.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex17-jobs-cronjobs.yaml` for template structure.
