using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HouseDoor : MonoBehaviour
{
    [SerializeField] Animator doorAnimator;
    [SerializeField] Collider doorTrigger;
    [SerializeField] ControllerState player;


    private void OnTriggerStay(Collider collider)
    {
        //Raycast to see if a valve is clicked with the cursor
        if (Input.GetMouseButton(0))
        {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            //If a gameObject is hit by the raycast
            if (Physics.Raycast(ray, out hit, 100.0f))
                if (hit.transform != null)
                {
                    if (hit.transform.gameObject.name.Equals("House Door"))
                    {
                        Cursor.lockState = CursorLockMode.Locked;
                        Cursor.visible = false;
                        doorTrigger.enabled = false;
                        doorAnimator.Play("DoorOpen", 0, 0.0f);
                        player.UnFreezeController();
                    }
                }
        }
    }
}
