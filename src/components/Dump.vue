<template>
  <div>
    <div class="panel panel-default">
      <div class="panel-heading" >
        <div class="details" @click="show = !show">
          <span>From : {{ dump.app }}</span>
          <span>in {{ dump.source.name }} line {{ dump.source.line }}</span>
          <span>{{ countdown }}</span>
        </div>
        <i class="fa fa-close" @click="deleteSelf()"></i>
      </div>
      <div class="panel-body" v-show="show" v-html="dump.content" :id="dump.id"></div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import 'moment-countdown'

export default {
  props: ['dump'],
  data () {
    return {
      show: true,
      now: moment.utc().toDate()
    }
  },
  mounted () {
    var self = this
    setInterval(function () {
      self.now = moment.utc().toDate()
    }, 1000)
  },
  computed: {
    countdown () {
      if (this.dump && this.dump.datetime) {
        var date = moment.utc(this.dump.datetime).toDate()

        return moment(this.now).countdown(date).toString()
      } else {
        return null
      }
    }
  },
  methods: {
    deleteSelf () {
      this.$emit('delete')
    }
  }
}
</script>

<style scoped>
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
    cursor: pointer;
  }
</style>
