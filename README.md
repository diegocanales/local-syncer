# Local Syncer Script

This is a simple project to get familiar with the workings of Unison and fswatch. This Bash script syncs changes between two local directories that happen during a specified interval.

## Pre-requisites

- Unison
- fswatch

## Usage

First, make sure that this script is executable. You can add the executable permission using:

```bash
chmod +x local_syncer.sh
```

Run the script by providing two directories to monitor and a Unison profile name:

``` bash
./local_syncer.sh /path/to/directory1 /path/to/directory2 profile_name sleep_time
```

`sleep_time` is optional, if not provided, it uses 1 by default.

## Parameters

- `DIRECTORY_1,$1`: First directory to monitor and sync.
- `DIRECTORY_2,$2`: Second directory to monitor and sync.
- `UNISON_PROFILE,$3`: The Unison profile name.
- `SLEEP,$4`: The time interval which the script should sleep/wait until the next sync. If not provided, the script will use 1 as the default value.

## Error Handling

If two directories and a Unison profile name are not provided, the script will fail with an error message. Please ensure these are provided as input arguments when running the script.

## Process

- The script first runs a sync using Unison.
- It then enters a continuous loop where it:
  - Monitors for changes in the provided directories.
  - On identifying a change, it echoes the file/directory in which this took place.
  - Runs a sync using Unison again.
- The script will sleep for the provided time interval (or 1 second if not provided) before starting the loop again.
