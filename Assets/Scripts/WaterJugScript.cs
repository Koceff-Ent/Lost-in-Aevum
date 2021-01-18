using UnityEngine;

public class WaterJugScript : MonoBehaviour
{
    [SerializeField] Animator animatorMiddleValve;


    private void OnTriggerStay(Collider collider)
    {
        //Raycast to see if a valve is clicked with the cursor
        if (Input.GetMouseButton(0))
        {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out hit, 100.0f))
                if (hit.transform != null && hit.transform.gameObject.name.Equals("MiddleValve"))
                {
                    animatorMiddleValve.Play("ValveSpin", 0, 0.0f);
                    animatorMiddleValve.Play("BigWaterReduce", 1, 0.0f);
                    animatorMiddleValve.Play("SmallWaterIncrease", 2, 0.0f);
                }
        }
    }

}
