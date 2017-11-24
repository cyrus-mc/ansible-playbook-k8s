@Library('shared-library@master') _

withPython(image: 'python:3.6.3-alpine3.6') {
  slave {

    /* set log retention */
    properties ([
      [ $class: 'BuildDiscarderProperty', strategy: [ $class: 'LogRotator', daysToKeeyStr: '7', numToKeep: '10' ] ],
    ])

    /* set status to success */
    currentBuild.result = 'SUCCESS'

    stage('Execute') {
      sh '''
        /bin/sleep 120
      '''
    }
  }
}
