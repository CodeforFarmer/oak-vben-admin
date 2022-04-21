<template>
  <div class="list-items">
    <template v-if="loading">
      <div v-for="n in 6" :key="n" class="loading-item">
        <span class="glow-checkbox" />
        <span class="glow-text">
          <span>Loading</span> <span>cool</span> <span>state</span>
        </span>
      </div>
    </template>
    <template v-else-if="isEmpty">
      <div class="wrapper-message">
        <span class="icon-check" />
        <div class="title-message">You have no tasks</div>
        <div class="subtitle-message">Sit back and relax</div>
      </div>
    </template>
    <template v-else>
      <Task
        v-for="task in tasksInOrder"
        :key="task.id"
        :task="task"
        @archive-task="onArchiveTask"
        @pin-task="onPinTask"
      />
    </template>
  </div>
</template>

<script>
import Task from "./Task";
import { reactive, computed } from "vue";

export default {
  name: "TaskList",
  components: { Task },
  props: {
    tasks: { type: Array, required: true, default: () => [] },
    loading: { type: Boolean, default: false },
  },
  emits: ["archive-task", "pin-task"],

  setup(props, { emit }) {
    props = reactive(props);
    return {
     tasksInOrder:computed(()=>{
       return [
         ...props.tasks.filter(t => t.state === 'TASK_PINNED'),
         ...props.tasks.filter(t => t.state !== 'TASK_PINNED'),
       ]
     }),
      isEmpty: computed(() => props.tasks.length === 0),
      /**
       * Event handler for archiving tasks
       */
      onArchiveTask(taskId) {
        emit("archive-task", taskId);
      },
      /**
       * Event handler for pinning tasks
       */
      onPinTask(taskId) {
        emit("pin-task", taskId);
      },
    };
  },
};
</script>