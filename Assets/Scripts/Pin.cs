using TMPro;
using UnityEngine;

public class Pin : MonoBehaviour
{
    [SerializeField] TextMeshProUGUI code;
    [SerializeField] Animator animatorDoorOpen;
    [SerializeField] BoxCollider triggerCollider;
    [SerializeField] ControllerState player;
    bool cursorShown = false;



    private void OnTriggerStay (Collider collider)
    {

        //If code inputed is 4 didgits
        if (code.text.Length == 4)
        {
            //If its correct
            if (code.text.Equals("2472"))
            {
                FindObjectOfType<AudioManager>().Play("Correct");
                FindObjectOfType<AudioManager>().Play("DoorOpenSound");
                cursorShown = false;
                Cursor.lockState = CursorLockMode.Locked;
                triggerCollider.enabled = false;
                animatorDoorOpen.Play("DoorOpen", 0, 0.0f);
                player.UnFreezeController();

            }
            //If incorrect
            else
            {
                code.text = "";
                FindObjectOfType<AudioManager>().Play("Wrong");

            }
        }
    }

}
