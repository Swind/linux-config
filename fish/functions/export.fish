function export
    for i in $argv
        set -l __export_var (echo -n $i | grep -o '^[^=]*')
        if test $__export_var = $i
            set -g -x $__export_var $$__export_var
        else
            set -g -x $__export_var (echo -n $i | sed -e 's/^[^=]*=//')
        end
    end
end
