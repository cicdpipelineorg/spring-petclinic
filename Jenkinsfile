def imagename = "sujith140/deploy:$BUILD_NUMBER"
def registryCredential = 'dockerhubfinal'
def dockerImage = ''
node('docker')
{
stage('git')
{
git url:'https://github.com/cicdpipelineorg/spring-petclinic.git', branch:'main'
}
stage('building image')
{

dockerImage = docker.build imagename
}

stage('push image to repository')
{
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
}
}
stage('cleaning up')
{
sh "docker rmi $imagename"
}
}
node('kubernetes')
{
    stage('deploying to kubernetes')
{
    git url:'https://github.com/cicdpipelineorg/spring-petclinic.git', branch:'main'
    sh 'envsubst < deploy.yaml | kubectl apply -f -' 
}

}
