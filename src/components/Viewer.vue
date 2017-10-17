<template>
  <div>
    <div class="page-header">
      <h1>VarDumper <small>Viewer</small></h1>
      <div>
        <button class="btn btn-danger" @click="clearDumps()">Clear</button>
      </div>
    </div>

    <dump v-for="dump in dumps" :dump="dump" @delete="deleteDump(dump)" class="col-xs-12" :key="dump.id"/>
  </div>
</template>

<script>
import Dump from '@/components/Dump'

export default {
  components: {
    Dump
  },
  data () {
    return {
      dumps: []
    }
  },
  mounted () {
    let _self = this
    let socket = io.connect() // eslint-disable-line no-undef
    socket.on('connect', function (data) {
      socket.on('dump', function (data) {
        _self.dumps.unshift(data)
      })
    })
  },
  methods: {
    deleteDump (dump) {
      let index = this.dumps.indexOf(dump)
      if (index > -1) {
        this.dumps.splice(index, 1)
      }
    },
    clearDumps () {
      this.dumps = []
    }
  }
}
</script>

<style scoped>
  .panel-heading i {
    cursor: pointer;
  }

  .panel-heading {
    display: flex;
    flex-direction: row;
  }

  .panel-heading .details {
    display: flex;
    flex-direction: column;
    align-items: left;
    flex: 1;
  }

  .panel-heading i {
    display: flex;
    align-items: center;
  }

  .page-header {
    display: flex;
    flex-direction: row;
    margin: 20px 0;
    padding: 0;
  }

  .page-header h1 {
    display: flex;
    align-items: baseline;
    flex: 1;
  }

  .page-header small {
    padding-left: 10px;
  }

  .page-header div {
    display: flex;
    align-items: center;
  }
</style>
