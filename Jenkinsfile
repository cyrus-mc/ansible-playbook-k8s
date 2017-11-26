@Library('shared-library@master') _

withAnsible(image: 'cyrusmc/ansible:2.4.0') {
  slave {

    /* set log retention */
    properties ([
      [ $class: 'BuildDiscarderProperty', strategy: [ $class: 'LogRotator', daysToKeeyStr: '7', numToKeep: '10' ] ],
      parameters ([
        string(name: 'hostname', description: 'The hostname of the target'),
        string(name: 'ipaddr', description: 'The accessible IP address of the target'),
        choice(name: 'component', choices: 'control-plane\nnode', description: 'The playbook to execute on the target')
      ])
    ])

    /* set status to success */
    currentBuild.result = 'SUCCESS'

    stage('Set Display Name') {
      // this job is used to automate playbook runs as machines are dynamically
      // provisioned. Set the display name to indicate machine this run was for
      currentBuild.displayName = "${params.hostname} : ${params.component}"
    }

    container('ansible') {

      stage('Download Galaxy Roles') {
        def exists = fileExists 'requirements.yml'

        if (exists) {
          sh '''
            ansible-galaxy install -c -r requirements.yml
          '''
        }
      }

      stage('Execute playbook') {
        writeFile file: 'inventory.ini', text: "${params.ipaddr}"

        ansiblePlaybook (
          playbook: "playbooks/${params.component}.yml",
          inventory: 'inventory.ini',
          credentialsId: 'coreos',
        )
      }

    }
  }
}
