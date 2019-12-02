# Introduction

The purpose of this APP is to demonstrate, what it takes for a developer to interact with OpenShift Container Storage Object Bucket Claim feature and consume Object Storage as a persistent layer.

# The Working

![](https://github.com/ksingh7/openshift-photo-album-app/raw/master/Image-1.png)

# Deployment

- Edit `` photo_album_app_on_OCS_OBC.yaml `` and change the following if needed
  - Update ``ENDPOINT_URL`` environment variable. You can get this using `` oc get route -n openshift-storage``
- Deploy the App
  - `` oc apply -f photo_album_app_on_OCS_OBC.yaml ``

```
$ oc apply -f photo_album_app_on_OCS_OBC.yaml
objectbucketclaim.objectbucket.io/photo-album created
imagestream.image.openshift.io/photo-album created
deploymentconfig.apps.openshift.io/photo-album created
service/photo-album created
route.route.openshift.io/photo-album created
```

This should create an OBC and other stuff needed for the app itself like POD,SVC,ROUTE. Together with OBC, you will also get new secrets and config maps created. The important resources could be listed as
- `` oc get po,svc,route,obc,secret,cm``

At this point your app is ready to be accessed externally. Grab the URL and browse it

- A simple landing page of the app will appear
![](https://github.com/ksingh7/openshift-photo-album-app/raw/master/image2.jpg)
- When you enter the album, you can upload or view your photos
![](https://github.com/ksingh7/openshift-photo-album-app/raw/master/Image-3.png)
- Finally looks like 
![](https://github.com/ksingh7/openshift-photo-album-app/raw/master/Image-4.jpg)





