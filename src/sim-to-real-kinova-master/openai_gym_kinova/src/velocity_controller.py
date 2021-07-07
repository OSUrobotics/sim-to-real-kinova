#! /usr/bin/env python2

# control this with python2!

# ros and kinova stuff
import rospy

# finger velocity control
from kinova_msgs.msg import PoseVelocityWithFingerVelocity
from std_msgs.msg import Bool


class VelocityController:
    """
    Publisher that publishes by velocity.

    TODO: ASYNC SHENANGIANS WITH SELF.DONE???
    """

    def __init__(self, vel_pub_channel='/j2s7s300_driver/in/cartesian_velocity_with_finger_velocity',
                 vel_sub_channel='/finger_velocity', finish_sub_channel='/finish_velocity_controller'):
        self.done = False

        # most recent velocity
        self.finger_velocity = PoseVelocityWithFingerVelocity()

        # queue size - 10 publishes. At a rate of 100hz, this should be a queue of up to 0.1 of a second.
        self.finger_velocity_pub = rospy.Publisher(vel_pub_channel,
                                                   PoseVelocityWithFingerVelocity, queue_size=10)
        # subscriber channel, this is the callback to updating velocity.
        self.finger_velocity_sub = rospy.Subscriber(vel_sub_channel, PoseVelocityWithFingerVelocity, self.update_velocity, queue_size=10)

        # sub channel to the finish state
        self.finish_sub = rospy.Subscriber(finish_sub_channel, Bool, self.finish, queue_size=10)

    def update_velocity(self, new_vel):
        # input msg type: PoseVelocityWithFingerVelocity
        # updates the velocity in the buffer.
        # input: should be an array of 3 velocities

        # to deal with async shenanagians: only update if self.done
        if not self.done:
            self.finger_velocity.finger1 = new_vel.finger1
            self.finger_velocity.finger2 = new_vel.finger2
            self.finger_velocity.finger3 = new_vel.finger3

    def finish(self, msg):
        """
        subscribe callback
        sets self.done to value of boolean. Note: we don't handle finger velocity here.
        This can also turn the velocity controller on.
        """
        self.done = msg

    def pub(self):
        """
        Publishes the new velocity.
        Returns True if publishing was successful.
        Note: You need to run this at 100hz in order to have the proper velocity movement
        """
        if self.done:
            self.finger_velocity.finger1 = 0
            self.finger_velocity.finger2 = 0
            self.finger_velocity.finger3 = 0
            return False

        # in between here: we are safe from a change in self.finger_velocity (see update_velocity() comments)

        # note: everytime this publishes, IIRC the other velocities will be
        self.finger_velocity_pub.publish(self.finger_velocity)
        return True


def velocity_control_loop():
    rospy.init_node('velocity_controller', anonymous=True)

    rate = rospy.Rate(100)  # 100hz

    vel_controller = VelocityController(vel_pub_channel='/j2s7s300_driver/in/cartesian_velocity_with_finger_velocity',
                                        vel_sub_channel='/finger_velocity',
                                        finish_sub_channel='/finish_velocity_controller')

    while not rospy.is_shutdown():
        vel_controller.pub()
        rate.sleep()


if __name__ == '__main__':
    try:
        velocity_control_loop()
    except rospy.ROSInterruptException:
        pass
