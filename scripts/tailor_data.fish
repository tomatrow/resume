function tailor_data -d 'Tailors resume data.' -a tailored_data_yaml_file

    # Check the extention is yml (do I really need this?)
    # begin 
    #     set explosion (echo "$tailored_data_yaml_file" | string split '.')
    #     set extention (echo $explosion[(count $explosion)])
    #     if not string match -q "$extention" 'yml'
    #         echo "Need a '.yml' file" >&2
    #         return 1
    #     end 
    # end 

    # Constants 
    set -l project_root '/Users/ajcaldwell/Projects/resume'
    set -l general_data_yaml_file "$project_root/data/general_data.yml"

    # read general and tailored data 
    cat $general_data_yaml_file | read -z general_data
    cat $tailored_data_yaml_file | read -z tailored_data

    # Make sure tailored_data keys are not already used in general_data (psub is awesome)
    function getkeys -a data; echo $data | yq -r 'keys[]'; end
    set -l common_keys (comm -12 (getkeys $tailored_data | psub) (getkeys $general_data | psub))
    if test (count $common_keys) -ne 0
        echo "General Data and tailored Data share keys: $common_keys" >&2
        return 2 
    end 

    # Combine the tailored data and the general data 
    echo -e "$general_data\n$tailored_data" | yq --yaml-output --slurp 'add' | read -z combined_yaml

    # Output in the (hacky) form required by best-resume-ever. 
    #     Specifically, '/* #*/ export const PERSON = `' at the top and a '`' at the last. 
    #     Note. Must be reading it directly into another language. 
    echo -e "/* #*/ export const PERSON = `\n$combined_yaml\n`" > "$project_root/data/data.yml"

end