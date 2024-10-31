#!/bin/bash

# Array of script filenames to run
SCRIPTS=("theme_pdk_kommuneplan_oversigt_forslag_v_update.sh"
         "theme_pdk_kommuneplan_oversigt_vedtaget_v_update.sh"
         "theme_pdk_lokalplan_forslag_v_update.sh"
         "theme_pdk_lokalplan_vedtaget_v_update.sh"
         "theme_pdk_zonekort_samlet_v_update.sh"
         "theme_pdk_zonekort_v.sh")

# Clear error log at the start of the script
> error_log.txt

# Get the current timestamp before running any scripts
START_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Loop through each script and execute it
for SCRIPT in "${SCRIPTS[@]}"; do
    echo "Running $SCRIPT..."

    # Run the script and capture its output and errors
    sh "$SCRIPT" >> "script_output.log" 2>> "error_log.txt"
    
    # Check if the script executed successfully
    if [ $? -eq 0 ]; then
        echo "$SCRIPT executed successfully."
    else
        echo "Error: $SCRIPT failed to execute." >> error_log.txt
        # You can choose to exit on the first error, or comment this line to continue
        # exit 1  
    fi
done

# After all scripts have run, update the last download timestamp
echo "$START_TIME" > last_download.txt
echo "Last download timestamp updated."
