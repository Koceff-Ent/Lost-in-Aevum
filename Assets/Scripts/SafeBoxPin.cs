using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class SafeBoxPin : MonoBehaviour
{
    [SerializeField] string correctCode;
    [SerializeField] TextMeshProUGUI code;
    [SerializeField] ControllerState player;
    [SerializeField] AudioClip sound_Correct;
    [SerializeField] AudioClip sound_Wrong;
    [SerializeField] AudioClip sound_DoorOpen;

    AudioSource audioSource;
    BoxCollider triggerCollider;
    Animator animatorDoorOpen;



    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        triggerCollider = GetComponent<BoxCollider>();
        animatorDoorOpen = GetComponent<Animator>();
    }

    private void OnTriggerStay(Collider collider)
    {
        //If code inputed is 4 didgits
        if (code.text.Length == 4)
        {
            //If its correct
            if (code.text.Equals(correctCode))
            {
                audioSource.clip = sound_Correct;
                audioSource.Play();

                StartCoroutine(WaitForSound());

                Cursor.lockState = CursorLockMode.Locked;
                triggerCollider.enabled = false;
                player.UnFreezeController();

            }
            //If incorrect
            else
            {
                code.text = "";
                audioSource.clip = sound_Wrong;
                audioSource.Play();

            }
        }
    }

    public IEnumerator WaitForSound()
    {
        yield return new WaitUntil(() => audioSource.isPlaying == false);
        audioSource.clip = sound_DoorOpen;
        audioSource.Play();
        animatorDoorOpen.Play("SafeBox Open", 0, 0.0f);

    }

}
