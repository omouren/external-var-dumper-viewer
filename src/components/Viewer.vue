<template>
  <div>
    <div class="page-header">
      <h1>VarDumper <small>Viewer</small></h1>
      <div>
        <button class="btn btn-danger" @click="clearDumps()">Clear</button>
      </div>
    </div>

    <div v-for="dump in dumps" class="col-xs-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <span>From : {{ dump.app }}</span>
          <i class="fa fa-close" @click="deleteDump(dump)"></i>
        </div>
        <div class="panel-body" v-html="dump.content"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
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

  .panel-heading span {
    display: flex;
    align-items: center;
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
