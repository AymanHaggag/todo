abstract class TodoStates {}

class TodoInitialState extends TodoStates {}

class ChangeBtmNavBarState extends TodoStates {}

class TodoGetUsersLoadingState extends TodoStates {}

class TodoGetTasksLoadingState extends TodoStates {}

class TodoGetUsersSuccessfulState extends TodoStates {}

class TodoGetUsersErrorState extends TodoStates {}

class TodoGetUsersTasksSuccessfulState extends TodoStates {}

class TodoGetUsersTasksErrorState extends TodoStates {}

class TodoGetUserTasksState extends TodoStates {}

class TodoGetUserUncompletedTasksState extends TodoStates {}

class TodoGetUserCompletedTasksState extends TodoStates {}