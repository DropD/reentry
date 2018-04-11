set -ev
case "$TEST_TYPE" in 
    unittests)
        tox
        ;;
    pre-commit)
        pre-commit run --all-files
        git diff
        pip freeze | grep yapf
        ;;
    *)
        echo "Invalid value for TEST_TYPE env variable."
        exit 1
esac
