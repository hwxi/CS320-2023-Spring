# CS320-2023-Spring
For teaching BU CAS CS525: Compiler Design and Implementation.

## Mirroring this repository

Please create a private repository that mirrors this one and update
frequently.

Step 1:

Please clone the class repository:

```
git clone https://github.com/hwxi/CS320-2023-Spring
```

Step 2:

Please create a repository of your own.
For instance, the following one is created
for my own use:

https://github.com/hwxi/CS320-2023-Spring-hwxi

Then please mirror-push the class repo into your own repo:

```
cd CS320-2023-Spring
git push --mirror https://github.com/hwxi/CS320-2023-Spring-hwxi
git clone https://github.com/hwxi/CS320-2023-Spring-hwxi
cd CS320-2023-Spring-hwxi
git remote add upstream https://hwxi@github.com/hwxi/CS320-2023-Spring.git
```

Step 3:

Please remember to sync with the class repo frequently:

```
git fetch upstream
git merge upstream/main main
```
