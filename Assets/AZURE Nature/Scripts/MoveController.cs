using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveController : MonoBehaviour
{
    public float movementSpeed;
    public float jumpSpeed;
    public float runMultiplier;
    public float gravity = -9.81f;    
    Vector3 velocity; 
    private CharacterController characterController;
    [SerializeField] private AudioClip[] m_FootstepSounds;    // an array of footstep sounds that will be randomly selected from.
    [SerializeField] private AudioClip m_JumpSound;           // the sound played when character leaves the ground.
    [SerializeField] private AudioClip m_LandSound;           // the sound played when character touches back on ground.
    private AudioSource m_AudioSource;




    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
        m_AudioSource = GetComponent<AudioSource>();
    }
    
    void Update()
    {
            if(characterController.isGrounded && velocity.y < 0)
            {
                velocity.y = -2f;
            }

            float x = Input.GetAxis("Horizontal");
            float z = Input.GetAxis("Vertical");

            Vector3 movement = transform.right * x + transform.forward * z;

            characterController.Move(movement * movementSpeed * Time.deltaTime);

            velocity.y += gravity * Time.deltaTime;
            PlayFootStepAudio();
            characterController.Move(velocity * Time.deltaTime);

            if(Input.GetButton("Jump") && characterController.isGrounded)
            {
                velocity.y = Mathf.Sqrt(jumpSpeed * -2f * gravity);
            m_AudioSource.clip = m_JumpSound;
            m_AudioSource.Play();
        }


            if(Input.GetKey(KeyCode.LeftShift))
            {
                characterController.Move(movement * Time.deltaTime * runMultiplier);
            }

        }

    private void PlayFootStepAudio()
    {
        if (!characterController.isGrounded)
        {
            return;
        }
        // pick & play a random footstep sound from the array,
        // excluding sound at index 0
        int n = Random.Range(1, m_FootstepSounds.Length);
        m_AudioSource.clip = m_FootstepSounds[n];
        m_AudioSource.PlayOneShot(m_AudioSource.clip);
        // move picked sound to index 0 so it's not picked next time
        m_FootstepSounds[n] = m_FootstepSounds[0];
        m_FootstepSounds[0] = m_AudioSource.clip;
    }



}
