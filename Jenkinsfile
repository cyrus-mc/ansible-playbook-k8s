@Library('shared-library@master') _

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
