#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process processFiles {
    input:
    val param_set

    container 'test1.sif'

    output:
    path "processed_${param_set.replaceAll(/[\s-]+/, '_')}.log"

    script:
    """
    echo "Running with parameters: '${param_set}'"
    singularity exec /home/maria/Universidad/Proyecto/SoftRobots.DesignOptimization/Singularityfiles/test1.sif  \
        python3 /home/maria/Universidad/Proyecto/SoftRobots.DesignOptimization/main.py ${param_set} \
        > processed_${param_set.replaceAll(/[\s-]+/, '_')}.log
    """
}

workflow {
    param_sets = [
        '-n SensorFinger -op 0 -o -ni 5',
        '-n SensorFinger -op 1 -o -ni 5',
        '-n SensorFinger -op 2 -o -ni 5'
    ]

    Channel
        .from(param_sets)
        .set { param_channel }

    processFiles(param_channel)
}

