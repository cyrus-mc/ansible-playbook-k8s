@Library('shared-library@master') _

withAnsible(image: 'cyrusmc/ansible:2.3.0') {
  slave {

    /* set log retention */
    properties ([
      [ $class: 'BuildDiscarderProperty', strategy: [ $class: 'LogRotator', daysToKeeyStr: '7', numToKeep: '10' ] ],
      parameters ([
        string(name: 'hostname', defaultValue: 'NOT_SET', description: 'The hostname of the target'),
        string(name: 'ip', defaultValue: '127.0.0.1', description: 'The accessible IP address of the target')
        choice(name: 'playbook', choices: 'control-plane\nnode', description: 'The playbook to execute on the target')
      ])
    ])

    /* set status to success */
    currentBuild.result = 'SUCCESS'

    stage('Set Display Name') {
      // this job is used to automate playbook runs as machines are dynamically
      // provisioned. Set the display name to indicate machine this run was for
      currentBuild.displayName = "${params.hostname} : ${params.playbook}"
    }

    stage('Execute') {
      sh '''
        /bin/sleep 120
      '''
    }
  }
}
