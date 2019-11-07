# My assignments
query {   
  myassignments(
    userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" )
  {

   id
   stageName
   account{
     number
     name
   }
   staff{
     firstName
     lastName
   }
   task{
     name
   }
   report{
     comments
   }

  
 }
}

# my tasks (from my department)
query {   
  mytasks(
    userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" )
  {
	 
      id
      name
      staffs {
        id
        firstName
        lastName
      }
  
   
 }
}

# get tototal stats for user
 query {
    stages {
      name
      myTotalAssignments(userId: "9676bf1e-acce-4b97-a0cf-3028df2e76f0")
    }
  }

#   get total assignments by task type
query {   
  tasks
    
  {
	 name
   myTotalAssignments(userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" ) 
 }
}